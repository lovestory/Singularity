package com.hubspot.singularity;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.common.base.Optional;

public class SingularityTaskIdHistory {

  private final SingularityTaskId taskId;
  private final Optional<String> lastStatus;
  private final long createdAt;
  private final Optional<Long> updatedAt;
  private final Optional<String> directory;
  
  @JsonCreator
  public SingularityTaskIdHistory(@JsonProperty("taskId") SingularityTaskId taskId, @JsonProperty("lastStatus") Optional<String> lastStatus, @JsonProperty("createdAt") long createdAt, @JsonProperty("updatedAt") Optional<Long> updatedAt, @JsonProperty("directory") Optional<String> directory) {
    this.taskId = taskId;
    this.lastStatus = lastStatus;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.directory = directory;
  }

  public SingularityTaskId getTaskId() {
    return taskId;
  }

  public Optional<String> getLastStatus() {
    return lastStatus;
  }

  public Optional<Long> getUpdatedAt() {
    return updatedAt;
  }
  
  public Optional<String> getDirectory() {
    return directory;
  }

  public long getCreatedAt() {
    return createdAt;
  }

  @Override
  public String toString() {
    return "SingularityTaskIdHistory [taskId=" + taskId + ", lastStatus=" + lastStatus + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", directory=" + directory + "]";
  }

}
