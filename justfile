build:
    docker run -v $(pwd):/site bretfisher/jekyll build
serve:
    docker run -p 4000:4000 -v $(pwd):/site bretfisher/jekyll-serve


deploy: build
    rsync -e 'ssh -p 2222' --delete --info=progress2 -r ./_site pete-hamlin.com:/usr/share/homelabos/jekyll

clean:
    rm -rf _site .jekyll-cache vendor
