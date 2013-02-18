require 'pdfkit'

module PdfMaker
    class << self
        def registered(app)
            app.after_build do |builder|
                kit = PDFKit.new(File.new('build/index.html'),
                            :margin_top => 0,
                            :margin_bottom => 0,
                            :margin_left => 0,
                            :margin_right => 0,
                            :disable_smart_shrinking => true,
                            :dpi => 96)

                file = kit.to_file('build/resume.pdf')
                puts "PDF file written"
            end


        end
        alias :included :registered
    end
end

::Middleman::Extensions.register(:pdfmaker, PdfMaker)

