/*
 * SessionResponseTask.h
 *
 *  Created on: 23/06/2012
 *      Author: victor
 */

#ifndef SESSIONRESPONSETASK_H_
#define SESSIONRESPONSETASK_H_

class SessionResponseTask : public Task {
	Reference<BaseClient*> client;
	uint32 seed;

public:
	SessionResponseTask(BaseClient* cl, uint32 seed) {
		client = cl;
		this->seed = seed;
	}

	void run() {
		client->notifyReceivedSeed(seed);
	}
};


#endif /* SESSIONRESPONSETASK_H_ */
