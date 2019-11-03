# Freestyle

- Dashboard: Create a freestyle job
    - Save and build it (it should success)
- Job: Add git repo
    - ssh key for the user or credentials (different ways)
    - Save and build it
- Job: Build -> Add build step -> Execute shell
```bash
echo "hello"
```
- Configure: NodeJS
    - Manage Plugins
    - Global tool configuration
- Job: Build -> Add build step -> Execute shell
```bash
node --version
npm --version
```
- Job: Build, check logs and understand what is going on
- Job: Build environment
- Job: Build and check logs

- Job: Build -> Add build step -> Execute shell
```bash
echo "This is the release ${BUILD_NUMBER}" > release.txt
```
    - Save and build it (it should success)

- Job: Modify shell script
```bash
    mkdir -p build
    echo "This is the release ${BUILD_NUMBER}" > build/release.txt
    zip -r build.zip build
```
- Post build: archive the artifacts
```
    build.zip
```
- Configure: Publish over ssh
    - Manage Plugins
    - Configure system
- Job: Post build action -> Add post build action -> Publish over ssh
    - build.zip
    - unzip jenkins_deploy/build.zip