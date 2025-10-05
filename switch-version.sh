#!/bin/bash

# Switch between application versions
# Usage: ./switch-version.sh v1  or  ./switch-version.sh v2

VERSION=$1

if [ -z "$VERSION" ]; then
    echo "Usage: $0 <v1|v2>"
    echo "Example: $0 v1"
    exit 1
fi

if [ "$VERSION" != "v1" ] && [ "$VERSION" != "v2" ]; then
    echo "Error: Version must be 'v1' or 'v2'"
    exit 1
fi

echo "Switching to version $VERSION..."

# Update deployment.yaml
if [ "$VERSION" == "v1" ]; then
    sed -i 's|image: wil42/playground:v[12]|image: wil42/playground:v1|g' deployment.yaml
    sed -i 's|value: "v[12]"|value: "v1"|g' deployment.yaml
    echo "Switched to Version 1 (v1)"
    echo "   - Basic greeting message"
    echo "   - Simple feature list"
elif [ "$VERSION" == "v2" ]; then
    sed -i 's|image: wil42/playground:v[12]|image: wil42/playground:v2|g' deployment.yaml  
    sed -i 's|value: "v[12]"|value: "v2"|g' deployment.yaml
    echo "Switched to Version 2 (v2)"
    echo "   - Enhanced greeting message"
    echo "   - Extended feature list"
    echo "   - Additional new_in_v2 features"
fi

echo ""
echo "Next steps:"
echo "1. Commit and push changes to GitHub"
echo "2. ArgoCD will automatically detect and deploy the new version"
echo "3. Check ArgoCD dashboard for sync status"
echo ""
echo "To verify the change:"
echo "   git add deployment.yaml"
echo "   git commit -m 'Switch to $VERSION'"
echo "   git push origin main"
