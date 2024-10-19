FROM bretfisher/jekyll

WORKDIR /site
COPY Gemfile Gemfile.lock jekyll-theme-chirpy.gemspec ./
RUN bundle install
RUN bundle clean --force

ENTRYPOINT [ "bundle" ]

CMD ["exec", "jekyll", "--help"]
