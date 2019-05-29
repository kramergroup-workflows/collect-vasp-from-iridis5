# -------------------------------------------------------------------------------------------------------------
FROM alpine

# The VASP input files are expected in the folder
VOLUME [ "/data/vasp" ]

# SSH private keys are expected in folder
VOLUME [ "/ssh" ]

# The USERNAME is used to identify the account on the machine
ENV USERNAME "noone"

# The HOSTNAME of the login node
ENV HOSTNAME "iridis5_a.soton.ac.uk"

# Common base folder for all jobs
ENV BASEDIR "workflows"

# The JOB_NAME will be used to identify the calculation
# in the queue
ENV JOB_NAME "vasp" 

RUN apk --no-cache add openssh-client bash gettext

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]