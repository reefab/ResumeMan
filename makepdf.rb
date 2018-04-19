module PdfMaker
    class << self
        def registered(app)
            app.after_build do |builder|
                begin
                    require 'pdfkit'

                    kit = PDFKit.new(File.new('build/index.html'),
                                :print_media_type => true,
                                :viewport_size => '2480x3508',
                                :zoom => 0.8,
                                :dpi => 300)

                    file = kit.to_file('build/resume.pdf')

                    rescue Exception =>e
                        builder.say_status "PDF Maker",  "Error: #{e.message}", Thor::Shell::Color::RED
                        raise
                    end
                    builder.say_status "PDF Maker",  "PDF file available at build/resume.pdf"
                end


            end
            alias :included :registered
        end
    end

::Middleman::Extensions.register(:pdfmaker, PdfMaker)
