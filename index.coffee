git = require('simple-git')()
express = require 'express'
livereload = require 'express-livereload'

app = express()
app.use express.static('.')
livereload app, config={}

checkUpdate = () ->
	git.pull (error, data) ->
		if error
			console.log "error: #{error}"
		else
			if data.files?.length > 0
				console.log "found #{data.files.length} changes"
			else
				console.log "no changes"

setInterval checkUpdate, 5000

app.listen 3000, () ->
	console.log 'Example app listening on port 3000!'
