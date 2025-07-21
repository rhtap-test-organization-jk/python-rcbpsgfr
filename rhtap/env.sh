# from init
export REBUILD=${REBUILD-true}
export SKIP_CHECKS=${SKIP_CHECKS-true}

CI_TYPE=${CI_TYPE:-jenkins}

# from buildah-rhtap
TAG=$(git rev-parse HEAD)
export IMAGE_URL=${IMAGE_URL-quay.io/rhtap-test-organization-jk/python-rcbpsgfr:$CI_TYPE-$TAG}
export IMAGE=${IMAGE-$IMAGE_URL}

export DOCKERFILE=${DOCKERFILE-docker/Dockerfile}
export CONTEXT=${CONTEXT-.}
export TLSVERIFY=${TLSVERIFY-false}
export BUILD_ARGS=${BUILD_ARGS-""}
export BUILD_ARGS_FILE=${BUILD_ARGS_FILE-""}

# from ACS_*.*
export DISABLE_ACS=${DISABLE_ACS-false}
# Optionally set ROX_CENTRAL_ENDPOINT here instead of configuring a Jenkins secret
export ROX_CENTRAL_ENDPOINT="central-tssc-acs.apps.cluster-fw66b.fw66b.sandbox2891.opentlc.com:443"
export INSECURE_SKIP_TLS_VERIFY=${INSECURE_SKIP_TLS_VERIFY-true}

# for gitops, if acs scans are set, we still may not want that repo 
# to be updates so include an option to disable

export DISABLE_GITOPS_UPDATE=${DISABLE_GITOPS_UPDATE-false}
export GITOPS_REPO_URL=https://github.com/rhtap-test-organization-jk/python-rcbpsgfr-gitops

export PARAM_IMAGE=${PARAM_IMAGE-$IMAGE}
# Recompute this every time, otherwise it will be set BEFORE the file exists
# and be stuck at latest
export PARAM_IMAGE_DIGEST=$(cat "$BASE_RESULTS/buildah-rhtap/IMAGE_DIGEST" 2>/dev/null || echo "latest")

# From Summary
export SOURCE_BUILD_RESULT_FILE=${SOURCE_BUILD_RESULT_FILE-""}

# gather images params
export IMAGE_REGISTRY_USER="jkopriva"
export COSIGN_PUBLIC_KEY="LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUZrd0V3WUhLb1pJemowQ0FRWUlLb1pJemowREFRY0RRZ0FFK0dNZEs2T3Z4WHRYekp1RUZjYWxZc1NKSzdtRQo0Z2RhaWVHeG5MS2NuRVZHTWFFNFVtS28wbXFXaW9BeXZjbDNEY3BxZFRwdk5PZ0Uyc0xoeVpRcDd3PT0KLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0tCg=="

export TARGET_BRANCH=${TARGET_BRANCH-""}
# enterprise contract
export POLICY_CONFIGURATION=${POLICY_CONFIGURATION-"github.com/enterprise-contract/config//rhtap-v0.6"}
#internal, assumes jenkins is local openshift
export REKOR_HOST=${REKOR_HOST-https://rekor-server-tssc-tas.apps.cluster-fw66b.fw66b.sandbox2891.opentlc.com}
export IGNORE_REKOR=${IGNORE_REKOR-false}
export INFO=${INFO-true}
export STRICT=${STRICT-true}
export EFFECTIVE_TIME=${EFFECTIVE_TIME-now}
export HOMEDIR=${HOMEDIR-$(pwd)}
export TUF_MIRROR=${TUF_MIRROR-https://tuf-tssc-tas.apps.cluster-fw66b.fw66b.sandbox2891.opentlc.com}

# Allow PR to succeed even if TAS vars not configured
export FAIL_IF_TRUSTIFICATION_NOT_CONFIGURED=false

export SBOMS_DIR=results/sboms