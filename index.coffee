git = require 'simple-git'
express = require 'express'

app = express()
app.use express.static('.')
app.listen 3000, () ->
	console.log 'Example app listening on port 3000!'
