# aitkul-nurassyl-devops

DevOps Laboratory Work 1: Linux, Git, GitHub, Docker and Jenkins.

## About me

| Field | Value |
|---|---|
| Name | Nurassyl |
| Surname | Aitkul |
| Group | IT2-2307 |
| Student ID | 37375 |
| Course | DevOps |

In this project I built a small personal DevOps project step by step.
I wanted to see the whole way of the code: from a folder in Linux to a running
Docker container started automatically by Jenkins.

```
Linux -> Git -> GitHub -> Jenkins -> Build -> Test -> Docker Build -> Docker Run -> SUCCESS
```

## My environment

I use a MacBook with an Apple Silicon chip. First I tried Multipass, but it did
not work on my Mac, so I installed OrbStack and created an Ubuntu 24.04 virtual
machine called `devops`. I did all the work inside this Ubuntu machine.

## Part 1. Linux

- I created the project folder `~/devops/aitkul_nurassyl` with the folders
  `app`, `scripts`, `config`, `logs` and `backup`.
- I wrote my student information into `Aitkul_Nurassyl_info.txt` and the
  application settings into `config/app.conf`.
- I practised the basic commands: `pwd`, `ls`, `cd`, `mkdir`, `touch`, `cp`,
  `mv`, `rm`, `cat`, `head`, `tail`.
- I filled `logs/application.log` with 10 messages and searched it with `find`
  and `grep` (there are 2 ERROR messages).
- I created `private.txt` with permission 600 (only I can read and write it)
  and `public.txt` with permission 644 (everybody can read it, only I can change it).
- I wrote the Bash script `scripts/Aitkul_Nurassyl_system.sh`. It prints my
  information and system information (user, hostname, date, OS, disk, memory)
  and checks if my info file exists.
- I looked at processes with `ps`, `ps aux` and `top` and found the PID, owner,
  CPU and memory of a `sleep` process.

## Part 2. Git and GitHub

- I created a Git repository with `git init` and set my name and email.
- I saved my work in small commits with clear messages, so the history shows
  what I did and when.
- I added `.gitignore`, so Git does not track `*.log` files, the `backup/`
  folder and the `.env` file with secrets.
- I created the branch `development`, made a change there and merged it into `main`.
- I connected the local repository to GitHub and pushed both branches.

## Part 3. Docker

- I wrote a small Python application `app/app.py`. It reads my data from
  environment variables, prints it and works as a web server on port 5000.
- I wrote a `Dockerfile` (FROM, WORKDIR, COPY, RUN, ENV, EXPOSE, CMD) and built
  the image `aitkul-nurassyl-devops`.
- I ran the container `aitkul-nurassyl-container` and checked it with
  `docker ps`, `docker logs`, `docker exec` and `curl`.
- I passed my data with `-e STUDENT_NAME=...` and checked that the application
  really uses environment variables.
- I wrote `docker-compose.yml`, so the whole application starts with one command.

## Part 4. Jenkins

The `Jenkinsfile` describes my pipeline. Jenkins takes the code from this
repository and runs the stages Checkout, Build, Test, Docker Build and
Docker Run. The Jenkins Job is called `Aitkul_Nurassyl_DevOps`.

## Project structure

```
aitkul_nurassyl/
├── app/
│   └── app.py                     # Python application (port 5000)
├── config/
│   └── app.conf                   # application settings
├── scripts/
│   └── Aitkul_Nurassyl_system.sh  # Bash script: student + system information
├── Aitkul_Nurassyl_info.txt       # my student information
├── private.txt                    # permissions example (600)
├── public.txt                     # permissions example (644)
├── Dockerfile                     # how the Docker image is built
├── docker-compose.yml             # Docker Compose configuration
├── Jenkinsfile                    # Jenkins pipeline
└── .gitignore                     # ignores *.log, backup/, .env
```

## How to run my project

Run the Bash script:

```bash
./scripts/Aitkul_Nurassyl_system.sh
```

Build and run with Docker:

```bash
docker build -t aitkul-nurassyl-devops .
docker run -d --name aitkul-nurassyl-container -p 5000:5000 aitkul-nurassyl-devops
curl http://localhost:5000
```

Run with Docker Compose:

```bash
docker compose up -d --build
docker compose down
```

## Names used in this project

| Element | Name |
|---|---|
| Linux directory | aitkul_nurassyl |
| Bash script | Aitkul_Nurassyl_system.sh |
| GitHub repository | aitkul-nurassyl-devops |
| Docker image | aitkul-nurassyl-devops |
| Docker container | aitkul-nurassyl-container |
| Jenkins Job | Aitkul_Nurassyl_DevOps |

## What I learned

I understood how the tools are connected. Linux is the place where everything
runs, Git saves the history of my changes, GitHub keeps the code online,
Docker packs the application so it runs the same everywhere, and Jenkins
automates the build, test and run steps.
