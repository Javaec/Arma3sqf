class CfgIdentities
{

	#define SPEAKER(TYPE)\
		class ##TYPE##ENG\
		{\
			name = ##TYPE##ENG;\
			speaker = ##TYPE##ENG;\
			face = "";\
			glasses = "";\
			pitch = 1;\
		};\
		class ##TYPE##PER: ##TYPE##ENG\
		{\
			name = ##TYPE##PER;\
			speaker = ##TYPE##PER;\
		};\
		class ##TYPE##GRE: ##TYPE##ENG\
		{\
			name = ##TYPE##GRE;\
			speaker = ##TYPE##GRE;\
		};

	SPEAKER(Male01)
	SPEAKER(Male02)
	SPEAKER(Male03)
	SPEAKER(Male04)
	SPEAKER(Male05)
	SPEAKER(Male06)
	SPEAKER(Male07)
	SPEAKER(Male08)
	SPEAKER(Male09)
};