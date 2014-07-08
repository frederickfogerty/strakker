# Strakker API 

|Ver    |Comment					| Who       |
|-------|--------------				|-----------|
|1.0    |Initial document			|Frederick|
|1.1    |Added link to GFM, added version control|Rory|

This document contains all the required API methods for strakker. It is written in [GFM](https://help.github.com/articles/github-flavored-markdown)

The Phalcon documentation is [here](http://docs.phalconphp.com/en/latest/index.html)

##Default JSON structure
The default structure for data return for ember-data (see [here](http://emberjs.com/guides/models/connecting-to-an-http-server/) and [here](http://blog.embed.ly/post/50012690904/ember-at-embedly-tutorial-models-and-ember-data)) is: 

```
(JSON)
	item_type:
		attributes: values
	[item_children_type:] [
		attributes: values
	]
	[meta:]
		attr: val
```
Errors are handled by headers with `ember-data`, AFAIK.

I suggest we modify this to the following to make all requests consistent

```
(JSON)
	[request:]
		status: 'OKAY'/'ERROR'
		[code: ...]
		[message: ...]
		[auth: 'error'] 
		[redirect: url]
	item_type:
		attributes: values
	[item_children_type:] [
		attributes: values
	]
	[meta:]
		attr: val
```

## Authentication

### Login

```
Request Type: POST
Request Parameters: unknown yet, will include email and password
Response Format: access token
URI: /api/v1/auth/token
```

Implements OAuth 2 Password Grant methods

### Register
**NOTE: only called from CMS. A new customer will be refered to the website where there will be a form to complete and a PayPal link. Once they have paid, the ipn handler will create a login and password and send them the link to the login screen**

```
Request Type: POST
Request Parameters: 
	e-mail
	password
	[subscription type]
	...
Response Format: 
	request:
		status:
		[error:]
URI: /api/v1/auth/register
```

### Recover Password

```
Request Type: GET
Request Parameters: 
	e-mail
Response Format: 
	request:
		status:
		[error:]
URI: /api/v1/auth/recover
```

## Questionnaire

### List

```
Request Type: GET
Request Parameters: 
	[search]
		id
		date (range)
		name
		status
	[filter]
		number
Response Format:
	[request:]
		status:
	questionnaires: [
		attr: val
	]

URI: /api/v1/questionnaire/[?:attr=:value]
	 /api/v1/questionnaire/:id
```

### Update

```
Request Type: PUT
Request Format:
	questionnaire:
		id
		[name]
		[...]
Response Format:
	questionnaire:
		id
		[name]
		[...]
URI: /api/v1/questionnaire/:id
```

### New

```
Request Type: POST
Request Format:
	questionnaire:
		[name]
		[...]
Response Format:
	questionnaire:
		id
		[name]
		[...]
URI: /api/v1/questionnaire/
```



