# Demo County Site

## Usage
```shell
git clone git@github.com:imsenterprises/demo-county-site.git
git submodule update --init --recursive
hugo server -D
```
Open http://localhost:1313

For a new page: `hugo new name-of-page.md` (Or .html)
For a new post: `hugo new posts/name-of-post.md` (Or .html)

## Docker
```shell
docker-compose up -d
```