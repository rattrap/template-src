# template

```
git clone git@github.com:rattrap/template-src.git new-project
```

```
cd new-project
```

```
rm -rf .git
```

```
git init
```

```
git add .
```

```
git commit -m "Initial commit"
```

```
docker build -t new-project:latest .
```

```
docker run -it new-project:latest
```