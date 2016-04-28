git = require('simple-git')()

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

bs = require("browser-sync").create()
bs.watch("*.html").on("change", bs.reload)
bs.init { server: "." }
