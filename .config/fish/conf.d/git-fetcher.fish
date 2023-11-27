# 15% of the time, it fetches git every time
# no longer usable

if status --is-login; and status --is-interactive; and test (random 1 100) -le 15
    status --file
    # git-fetcher
end
