{{- define "python-backend.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "python-backend.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "python-backend.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "python-backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "python-backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "python-backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "python-backend.fastapiName" -}}
{{- printf "%s-fastapi" .Release.Name }}
{{- end }}

{{- define "python-backend.postgresqlName" -}}
{{- printf "%s-postgresql" .Release.Name }}
{{- end }}

{{- define "python-backend.grafanaName" -}}
{{- printf "%s-grafana" .Release.Name }}
{{- end }}

{{- define "python-backend.prometheusName" -}}
{{- printf "%s-prometheus-server" .Release.Name }}
{{- end }}

{{- define "python-backend.databaseUrl" -}}
{{- printf "postgresql+asyncpg://%s:%s@%s:5432/%s"
    .Values.postgresql.auth.username
    .Values.postgresql.auth.password
    (include "python-backend.postgresqlName" .)
    .Values.postgresql.auth.database }}
{{- end }}