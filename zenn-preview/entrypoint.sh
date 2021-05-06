# GITHUB_USERNAMES="octocat,misodengaku" # for examples. DO NOT ENABLE THIS LINE!

if [ -z "$GITHUB_USERNAMES" ]
then
	echo "GITHUB_USERNAMES is empty!"
	exit 1
fi

USER_LIST=(${GITHUB_USERNAMES//,/ })

mkdir /root/.ssh/
echo "import targets: ${GITHUB_USERNAMES}"
for username in "${USER_LIST[@]}"
do
	echo "importing SSH keys... https://github.com/${username}.keys"
	curl "https://github.com/${username}.keys" >> /root/.ssh/authorized_keys 2>/dev/null
done
echo "dump authorized_keys:"
cat /root/.ssh/authorized_keys


/usr/sbin/sshd -D &
echo "sshd started."
npx zenn preview
