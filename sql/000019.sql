drop index :GRAPHILE_WORKER_SCHEMA.jobs_main_index;
create index jobs_main_index
  on :GRAPHILE_WORKER_SCHEMA._private_jobs
  using btree (priority, run_at, id)
  include (task_id, job_queue_id)
  where (is_available = true);

drop index :GRAPHILE_WORKER_SCHEMA.jobs_no_queue_index;
create index jobs_no_queue_index
  on :GRAPHILE_WORKER_SCHEMA._private_jobs
  using btree (priority, run_at, id)
  include (task_id)
  where (is_available = true and job_queue_id is null);
  