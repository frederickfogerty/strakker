# Strakker API (v1)
This document will (hopefully) document all the required API methods for strakker

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



