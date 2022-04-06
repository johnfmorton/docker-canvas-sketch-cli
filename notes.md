sample command once inside the container

```
canvas-sketch anim.js --port 8888 --host=localhost  --stream  --output=media/
```

I *think* the stream command is what triggers saving an MP4 instead of a series of PNG files.

To save an mpg hold down `CNTR-SHIFT-S`.

## Making the Docker image locally

```
docker image build -t cs-test .
```

## Alias

Currently, I've got the Docker image saved as 'cs-test' as the tag name for the image so my alias looks like this. I use port 8888 here to expose it to my local machine. I don't think I actually need to expose the livereload port but I have not tested that yet.

```
alias cstest='docker run --rm -it -p 8888:8888 -p 35729:35729 -v "$PWD":/app cs-test '
```
