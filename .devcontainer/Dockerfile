#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#--------------------------------------------------:-----------------------------------------------------------

ARG DOTNETCORE_VERSION=3.1
FROM mcr.microsoft.com/dotnet/core/sdk:${DOTNETCORE_VERSION}
#FROM debian:stretch

# # # put the dotnet tools into the path
ENV PATH="${PATH}:/root/.dotnet/tools" 

RUN apt-get -y update \
&& apt-get -y upgrade 

RUN apt-get -y install curl

# install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash 

# install PowerShell
RUN echo INSTALL POWERSHELL \
&& dotnet tool install --global PowerShell 

# install NODE LTS
RUN echo INSTALL NODE \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash - \
&& apt-get install -y nodejs

RUN echo INSTALL LUISGEN \
&& dotnet tool install -g LUISGen

# install dotnet runtime 2.1
RUN echo INSTALL DOTNET RUNTIME 2.1 \
&& wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg \
&& mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
&& wget -q https://packages.microsoft.com/config/debian/10/prod.list \
&& mv prod.list /etc/apt/sources.list.d/microsoft-prod.list \
&& chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg \
&& chown root:root /etc/apt/sources.list.d/microsoft-prod.list \
&& apt-get update \
&& apt-get install -y dotnet-runtime-2.1

# # install bot tools
# RUN npm install -g ludown luis-apis qnamaker@1.3.1 

# # install dotnet2.1 and dispatch locally because of issue installing dotnet globally
# RUN cd ~/workspaces/MyAssistant/MyAssistant/MyAssistant \
#  && npm install botdispatch 


# build the base va
# RUN git clone https://github.com/microsoft/botframework-solutions.git ~/va

# update deploy scripts to run from local botdispatch install
# RUN cd ~/va/samples/csharp/assistants/enterprise-assistant/VirtualAssistantSample/Deployment/Scripts \
# && sed -i -e 's|dispatch init|node ~/node_modules/botdispatch/bin/dispatch.js init|g' ./deploy_cognitive_models.ps1 \
# && sed -i -e 's|dispatch add|node ~/node_modules/botdispatch/bin/dispatch.js add|g' ./deploy_cognitive_models.ps1 \
# && sed -i -e 's|dispatch create|node ~/node_modules/botdispatch/bin/dispatch.js create|g' ./deploy_cognitive_models.ps1 \
# && sed -i -e 's|dispatch refresh|node ~/node_modules/botdispatch/bin/dispatch.js refresh|g' ./deploy_cognitive_models.ps1 \
# && sed -i -e 's|dispatch init|node ~/node_modules/botdispatch/bin/dispatch.js init|g' ./update_cognitive_models.ps1 \
# && sed -i -e 's|dispatch add|node ~/node_modules/botdispatch/bin/dispatch.js add|g' ./update_cognitive_models.ps1 \
# && sed -i -e 's|dispatch create|node ~/node_modules/botdispatch/bin/dispatch.js create|g' ./update_cognitive_models.ps1 \
# && sed -i -e 's|dispatch refresh|node ~/node_modules/botdispatch/bin/dispatch.js refresh|g' ./update_cognitive_models.ps1 

# fix dir names for cognitive scripts
# RUN cd ~/va/samples/csharp/assistants/enterprise-assistant/VirtualAssistantSample/Deployment/Resources \
# && mv LU/en LU/en-us \
# && mv QnA/en QnA/en-us

# RUN cd ~/va/samples/csharp/assistants/enterprise-assistant/VirtualAssistantSample \
# && dotnet build

# # I also added a .yarnrc file with strict-ssl false. This solved the issue for me.
# # yarn config set strict-ssl false
# # RUN npm install -g botskills 

# RUN npm i -g @microsoft/botframework-cli
