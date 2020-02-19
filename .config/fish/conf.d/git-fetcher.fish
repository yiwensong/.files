# 15% of the time, it fetches git every time

if status --is-login; and status --is-interactive; and test (random 1 100) -le 15
    git-fetcher
end
