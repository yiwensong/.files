# we don't actually want the behavior of airtable_node_env.fish
#
# but it's autowritten whenever the repo updates so we use this function
# to deactivate nodeenv
if status --is-login
    status --file
    if type -q deactivate_node
        deactivate_node
    end
    cdenv .
end
