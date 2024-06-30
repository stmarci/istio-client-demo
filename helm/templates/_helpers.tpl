{{- define "kubernetes-client.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "kubernetes-client.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{- define "kubernetes-client.fullname" -}}
{{- printf "%s" .Chart.Name -}}
{{- end -}}

{{- define "kubernetes-client.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
{{- end -}}

{{- define "kubernetes-client.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
