# configs for airtable
if status --is-login; and status --is-interactive
    status --file
    # Activate nodeenv if needed
    cdenv .
end
