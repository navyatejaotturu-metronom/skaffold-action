# Skaffold action

```
   - name: skaffold build & publish 
      uses: anarcher/skaffold-action@v1
      with:
        skaffold: build 
        kustomize: edit set image hello-world:${IMAGE_TAG}
        kustomize_path: ./k8s/prod/
        docker_username: ${{ secrets.DOCKER_GITHUB_USERNAME }}
        docker_password: ${{ secrets.DOCKER_GITHUB_PASSWORD }}
      env:
        IMAGE_TAG: ${{ github.ref }}

```
