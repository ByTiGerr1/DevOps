import jenkins.model.*
import hudson.model.*
import hudson.tasks.*
import hudson.plugins.git.*
import hudson.scm.*

def jobNameDev = "taller2_dev"
def jobNameProd = "taller2_prod"
def repoUrl = "https://github.com/USER/REPO.git" // Replace with actual repo
def jenkins = Jenkins.instance

def createJob(jobName, branchPattern, deployPort) {
    def job = jenkins.getItem(jobName)
    if (job == null) {
        job = jenkins.createProject(FreeStyleProject, jobName)
    }

    def scm = new GitSCM(repoUrl)
    scm.branches = [new BranchSpec(branchPattern)]
    job.setScm(scm)

    job.getBuildersList().clear()
    job.getBuildersList().add(new Shell("echo 'Running SonarQube Analysis...'"))
    job.getBuildersList().add(new Shell("docker build -t ${jobName} ./taller2/src/backend"))

    def deployScript = """
    docker stop ${jobName} || true
    docker rm ${jobName} || true
    docker run -d -p ${deployPort}:5000 --name ${jobName} ${jobName}
    """
    job.getBuildersList().add(new Shell(deployScript))

    job.save()
    println("Job ${jobName} created/updated.")
}

createJob(jobNameDev, "feature/**", "5000")
createJob(jobNameProd, "release/**", "5001")
