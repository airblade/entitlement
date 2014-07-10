# Entitlement

Entitlement lets you set your page titles in a simple, DRY way.

Often you want a page's title to match its heading.  Although this is simple to arrange, adding Entitlement to your Gemfile instead is a one-liner.  And I'm sure you don't want to write tests for your page titles.

Entitlement works with Rails 3 and Rails 4.


## Getting started

To write out your page title, use `title`:

```html+erb
<head>
  <title><%= title %></title>
</head>
```

To set your page title, use `tee` in your page's header.  This will write it out on the spot too.

```html+erb
<h1><%= tee 'My page' %></h1>
```

`tee` is easy to remember because:

* it's a homonym for 't' (for title), and
* it acts like Unix's `tee`.

Or you can just use `title` again:

```html+erb
<h1><%= title 'My page' %></h1>
```


## Include your site's name

Use `:site`:

```html+erb
<head>
  <title><%= title :site => 'My site' %></title>
</head>
```

This will produce, for example:

```html
<head>
  <title>My page - My site</title>
</head>
```


## Reverse the title's order

By default, the site's title goes from small to large.  E.g. `My page - My site`.

Use `:big_endian` to reverse this.

```html+erb
<head>
  <title><%= title :site => 'My site', :big_endian => true %></title>
</head>
```

Which will produce:

```html
<head>
  <title>My site - My page</title>
</head>
```

## Change the separator

Use `:separator`:

```html+erb
<head>
  <title><%= title :site => 'My site', :separator => ': ' %></title>
</head>
```

Which will produce:

```html
<head>
  <title>My page: My site</title>
</head>
```


## Have a breadcrumb-like hierarchy

Pass the levels to `tee` (or `title`).  Go from small to large whether or not you're using `:big_endian` in the site's title.

```html+erb
<h1><%= tee 'Some article', 'Europe', 'News' %></h1>
```

Which will produce:

```
<h1>Some article</h1>
```

And:

```
<title>Some article - Europe - News</title>
```


## Inspiration

[Headliner](https://github.com/mokolabs/headliner)


## Intellectual Property

Copyright 2012 Andy Stewart (boss@airbladesoftware.com).
Released under the MIT licence.
