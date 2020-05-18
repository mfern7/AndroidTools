pipeline{
    parameters{
        string defaultValue: "https://github.com/nogala/AndroidTools",
            description: "Repository of Docker to build",
            name: "REPO"

        string defaultValue: "master",
            description: "Branch of repo to build",
            name: "BRANCH"

        booleanParam defaultValue: false,
            description: "Deploy to dockerhub ?",
            name: "DEPLOY"
    }

    environment {
        registry = "nogala/androidtest"
        registyCredential= "dockerhub"
        dockerimage= ""
    }

    agent none
    stages{
        stage ("Cloning Repo"){
            steps{
                git url: params.REPO, branch: params.BRANCH
            }
        }
        stage ("Build image"){
            steps{
                script{
                    dokerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage ("Deploy Image"){
            steps{
                script{
                    if (params.DEPLOY) {
                        docker.withRegistry ('', registyCredential) {
                            dockerImage.push()
                        }
                    }
                    else {
                        echo "not Deploy"
                    }
                }
            }
        }
    }
}