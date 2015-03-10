class CfgNotifications
{
	class TaskAssigned;
	class TaskCreated;
	class TaskSucceeded;
	class TaskFailed;
	class TaskCanceled;
	class TaskUpdated;

	class TaskAssignedVR: TaskAssigned
	{
		duration = 2;
	};
	class TaskAssignedVRLong: TaskAssigned
	{
		duration = 3;
	};
	class TaskCreatedVR: TaskCreated
	{
		duration = 2;
	};
	class TaskCreatedVRLong: TaskCreated
	{
		duration = 3;
	};
	class TaskSucceededVR: TaskSucceeded
	{
		duration = 2;
	};
	class TaskSucceededVRLong: TaskSucceeded
	{
		duration = 3;
	};
	class TaskFailedVR: TaskFailed
	{
		duration = 2;
	};
	class TaskFailedVRLong: TaskFailed
	{
		duration = 3;
	};
	class TaskCanceledVR: TaskCanceled
	{
		duration = 2;
	};
	class TaskCanceledVRLong: TaskCanceled
	{
		duration = 3;
	};
	class TaskUpdatedVR: TaskUpdated
	{
		duration = 2;
	};
	class TaskUpdatedVRLong: TaskUpdated
	{
		duration = 3;
	};
};