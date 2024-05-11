org=eli-sauvage
repo=dotfiles

run_ids=( $(gh api /repos/$org/$repo/actions/runs --paginate | jq '.workflow_runs[].id') )
for run_id in "${run_ids[@]}"
do
echo "Deleting Run ID $run_id"
gh api repos/$org/$repo/actions/runs/$run_id -X DELETE >/dev/null
done
