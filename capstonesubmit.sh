#!/bin/bash
cd home
condor_submit sleep.sub
condor_status
condor_q
