# Collect VASP calculations from Irdis5

This container collects a VASP calculation from Iridis5.

## Configuration

### Environment variables

The process is configured through environment variables

| Variable    | Default | Description                                                     |
| ----------- | ------- | --------------------------------------------------------------- |
| `JOB_NAME`  | `vasp`  | The name of the job. Used to find jobs in the queue             |
| `USERNAME`  | n/a     | The Iridis5 account used for this calculation                   |

### Volumes

The container expects some externally mounted volumes to provide information

| Mount point  | Content                                                        |
| ------------ | -------------------------------------------------------------- |
| `/data/vasp` | Contains the VASP input files (INCAR,POSCAR,POTCAR,KPOINTS)    |
| `/ssh`       | Should mount the users private RSA key for password-less login |

> The container expects the private key to reside in `/ssh/id_rsa` with appropriate permissions.
