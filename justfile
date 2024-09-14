set positional-arguments

build-image:
    docker build . --tag pete-hamlin/jekyll

build:
    docker run -v $(pwd):/site pete-hamlin/jekyll exec jekyll build
serve:
    docker run -p 4000:4000 -v $(pwd):/site pete-hamlin/jekyll exec jekyll serve -H 0.0.0.0
shell:
    docker run -v $(pwd):/site -it --entrypoint bash bretfisher/jekyll

@clean:
    rm -rf _site .jekyll-cache vendor

@draft draft:
    docker run -v $(pwd):/site pete-hamlin/jekyll exec jekyll draft "$@"

@publish publish:
    docker run -v $(pwd):/site pete-hamlin/jekyll exec jekyll publish $1

@post post:
    docker run -v $(pwd):/site pete-hamlin/jekyll exec jekyll post "$@"
