#!/bin/bash
LOGFILE="/var/log/maintenance.log"
log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" >> "$LOGFILE"
}

log_rotate() {
  /home/danish/log_rotate.sh /var/log/nginx >> "$LOGFILE"
  if [ $? -eq 0 ]; then
    log "Log rotation completed successfully"
  else
    log "Log rotation failed"
    exit 1
  fi
}

backup() {
  SOURCE="/var/log/nginx"
  DEST="/home/danish/nginx_backup"
  DATE=$(date +%Y-%m-%d)
  ARCHIVE="backup-$DATE.tar.gz"

  mkdir -p "$DEST"
  log "Starting backup of $SOURCE"
  if tar -czf "$DEST/$ARCHIVE" "$SOURCE"; then
    log "Backup created: $ARCHIVE"
  else
    log "Backup failed"
    exit 1
  fi
}

{
  log_rotate
  backup
} >> "$LOGFILE" 2>&1
