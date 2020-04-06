# Documentation

Snapmaker API documentations.

## Setup prooject

1. Install `rvm`
2. Install `ruby`
3. Install `bundler`

```shell
gem install bundler
```

4. Setup bundler environment

```shell
bundle config --local path 'vendor/bundle'
bundle install
```

5. Run dev server

```shell
bundle exec jekyll serve
```

## Documenting

### When editing G-code docs

Run dev server first, and then edit the G-code Markdown files in `resources/_gcode_overwrite`.

Run `Rake` task as below to re-generate formatted G-code files.

```shell
bundle exec rake gcode
```

(TODO: Run a watch on `resources` folder and run rake tasks automatically.)

## License

GPLv3
