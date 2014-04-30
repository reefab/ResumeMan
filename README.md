# Resume Man

Resume Man is an HTML and PDF resume builder made in Ruby with [Middleman](http://middlemanapp.com/).

It has the following features:

 * Separation between content and data, all your resume information is an YAML
   file.
 * Fork this project for maintening multiple versions of your resume in sync.
 * Markdown for formatting of the longer paragraphs.
 * Default template included: [SRT](http://sampleresumetemplate.net/).
 * You can preview your changes with Middleman's included server.
 * config.ru file included for use with [Pow](http://pow.cx).
 * Automatic PDF generation using [wkhtmltopdf](http://wkhtmltopdf.org).
 * Turnkey deployment to a `http://yourusername.github.com/resume` page with no configuration necessary. 
 * [hResume](http://microformats.org/wiki/hResume) microformat support.

## Preview

See the result: [sample resume](http://reefab.github.com/ResumeMan/).

## In practice

Fork this project and name it `resume` for example. 
Follow the installation instructions below.

To create/update your resume, you'll just need to edit the [`data/resume.yml`](https://github.com/reefab/ResumeMan/blob/master/data/resume.yml) file.
All keys with a `desc: |` header can be Markdown formated.

Here is what it looks like:

```yaml
info:
    name: Jonathan Doe
    shortdesc: Web Designer, Director
    email: example@example.com
    phone: (313) - 867-5309
    address:
        - 123 Fake Street
        - City, Country
    desc: |
        You can put Markdown in here [like this](http://daringfireball.net/projects/markdown/).
```

You can preview your changes via `http://resume.dev/` if using Pow or `http://localhost:4567/` otherwise.

    bundle exec middleman build

Build the static version of your resume, it'll also create the PDF version.

    bundle exec middleman deploy

Upload it to a github page. Your resume will be available at `http://yourusername.github.com/resume`.

## Installation

If you forked to your own repo:

    git clone https://github.com/<yourusername>/resume.git
    cd resume

Otherwise:

    git clone https://github.com/reefab/ResumeMan.git
    cd ResumeMan

Install all dependencies:

    sudo gem install bundler
    bundle install --path vendor/bundle

If using Pow, this will setup a previewing server that will be available at
http://resume.dev/

    ln -s `pwd`/. ~/.pow/resume

Otherwise, you'll have to launch the previewing server manually:

    bundle exec middleman
