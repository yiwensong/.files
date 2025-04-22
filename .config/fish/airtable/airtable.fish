# configs for airtable
if status --is-login; and status --is-interactive; and false # disable bc im not at airtable
    status --file
    # Activate nodeenv if needed
    cdenv .
end
