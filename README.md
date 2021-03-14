# avisynthplus-alpine

Docker image with [AviSynthPlus](https://github.com/AviSynth/AviSynthPlus) built in alpine.

If you find any outdated package, please report in [issues](https://github.com/kyori19/avisynthplus-alpine/issues).

## Tags

* `latest`: Latest stable version

## Usage

```Dockerfile
FROM kyori/avisynthplus-alpine:latest AS avisynthplus

FROM alpine:3.13.2

COPY --from=avisynthplus /output/ /usr/local/

# If you placed files to other than `/usr/` and `/usr/local/`, add this line
ENV PKG_CONFIG_PATH=${YOUR_INSTALL_PATH}/lib64/pkgconfig
```

## License

```LICENSE
   Copyright 2021 kyori19

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
```
