#!/bin/bash

# Test script for IoT application endpoints
# Usage: ./test-endpoints.sh [port]

PORT=${1:-8888}
HOST="localhost:$PORT"

echo "Testing IoT Application Endpoints"
echo "====================================="
echo "Host: $HOST"
echo ""

# Check if application is accessible
echo "Checking connectivity..."
if ! curl -s --connect-timeout 5 "$HOST/health" > /dev/null; then
    echo "Application not accessible at $HOST"
    echo ""
    echo "Make sure to run port-forward first:"
    echo "   kubectl port-forward svc/iot-app-service -n dev $PORT:8888"
    echo ""
    exit 1
fi

# Test main endpoint
echo "Testing main endpoint (/)..."
echo "Response:"
curl -s "$HOST/" | jq . || curl -s "$HOST/"
echo ""

# Test health endpoint
echo "Testing health endpoint (/health)..."
echo "Response:"
curl -s "$HOST/health" | jq . || curl -s "$HOST/health"
echo ""

# Test version endpoint
echo "Testing version endpoint (/version)..."
echo "Response:"
curl -s "$HOST/version" | jq . || curl -s "$HOST/version"
echo ""

# Show current version
echo "Current Application Version:"
VERSION=$(curl -s "$HOST/version" | jq -r '.version' 2>/dev/null || echo "unknown")
echo "   Version: $VERSION"

if [ "$VERSION" == "v1" ]; then
    echo "   Features: Basic greeting, Health check, Version info"
elif [ "$VERSION" == "v2" ]; then
    echo "   Features: Enhanced greeting, Extended API, Color theme"
    echo "   New in v2: Better UI messages, Extended feature list"
else
    echo "   Features: Unknown (check application logs)"
fi

echo ""
echo "Endpoint testing completed!"
echo ""
echo "To switch versions:"
echo "   1. Edit deployment.yaml in GitHub repository"
echo "   2. Or use: ./switch-version.sh v1|v2"
echo "   3. Commit and push changes"
echo "   4. ArgoCD will automatically update the deployment"
