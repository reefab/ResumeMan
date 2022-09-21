![Build Status](https://github.com/reefab/ResumeMan/actions/workflows/build.yaml/badge.svg?event=push)

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
![Docker Pulls](https://img.shields.io/docker/pulls/reefab/resumeman)

# Resume Man

Resume Man is an HTML and PDF resume builder made in Ruby with [Middleman](http://middlemanapp.com/).

It has the following features:

 * Separation between content and data, all your resume information is an YAML
   file.
 * Uses your Gravatar picture.
 * Fork this project for maintaining multiple versions of your resume in sync.
 * Markdown for formatting of the longer paragraphs.
 * You can preview your changes with Middleman's included server (with
   livereload).
 * Automatic PDF generation using [wkhtmltopdf](http://wkhtmltopdf.org).
 * Turnkey deployment to a `http://yourusername.github.io/resume` [GitHub page](https://pages.github.com) with no configuration necessary.
 * No external requests except for Gravatar picture if applicable, you can preview and build offline.

## Template used

[Orbit](https://github.com/xriley/Orbit-Theme) is the template used.

It was created by UX/UI designer Xiaoying Riley for developers and is 100% FREE under the Creative Commons Attribution 3.0 License (CC BY 3.0)

If you'd like to use the template without the attribution, you can check out other license options via the [theme website](http://themes.3rdwavemedia.com/website-templates/orbit-free-resume-cv-template-for-developers/) and edit `source/_footer.erb`.

There is multiple alternate colors available that you can select by modifying `source/stylesheets/style.less`.

## Preview

See the result: [sample resume](http://reefab.github.io/ResumeMan/).

## In practice

Fork this project and name it `resume` (suggested).
Follow the installation instructions below.

To create/update your resume, you'll just need to edit the [`data/resume.yml`](https://github.com/reefab/ResumeMan/blob/master/data/resume.yml) file.
All keys with a `desc: |` header can be Markdown formatted.

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

You can preview your changes via `http://localhost:4567/`.

### Custom domain

To use a custom domain with GitHub Pages, add a `CNAME` file in the `source` directory with your domain name and follow GitHub's documentation:

[About custom domains and Github Pages](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/about-custom-domains-and-github-pages).

### Docker installation (recommended)

Launch the previewing server:

    docker-compose up -d

Build the static version of your resume, it'll also create the PDF version.

    docker-compose exec preview bundle exec middleman build

Upload it to a Github page. Your resume will be available at `http://yourusername.github.io/resume`.

    ./deploy.sh

### Manual installation (deprecated)

*Probably won't work on recent systems due to dependencies issues.*

Install all dependencies:

    sudo gem install bundler
    bundle install --path vendor/bundle

Launch the previewing server:

    bundle exec middleman

Build the static version of your resume, it'll also create the PDF version.

    bundle exec middleman build

Upload it to a Github page. Your resume will be available at `http://yourusername.github.io/resume`.

    bundle exec middleman deploy

