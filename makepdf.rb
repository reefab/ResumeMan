module PdfMaker
    class << self
        def registered(app)
            app.after_build do |builder|
                begin
                    if (/darwin/ =~ RUBY_PLATFORM) != nil # For OS X with wkpdf
                        system('wkpdf --source build/index.html --stylesheet-media print --output build/resume.pdf')
                        if $?.exitstatus != 0
                            raise 'wkpdf failed to generate pdf'
                        end
                    else # For linux/others with PDFKit and wkhtmlpdf
                        require 'pdfkit'

                        kit = PDFKit.new(File.new('build/index.html'),
                                    :margin_top => 0,
                                    :margin_bottom => 0,
                                    :margin_left => 0,
                                    :margin_right => 0,
                                    :disable_smart_shrinking => true,
                                    :dpi => 96,
                                    :print_media_type => true)

                        file = kit.to_file('build/resume.pdf')
                    end

                    rescue Exception =>e
                        builder.say_status "PDF Maker",  "Error: #{e.message}", Thor::Shell::Color::RED
                        Raise 
                    end
                    builder.say_status "PDF Maker",  "PDF file available at build/resume.pdf"
                end


            end
            alias :included :registered
        end
    end

::Middleman::Extensions.register(:pdfmaker, PdfMaker)
