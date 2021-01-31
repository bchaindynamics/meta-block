import React from 'react';

export default function Candidate(props) {
  return (
    <div className="row ml-auto mr-auto mt-2  mb-2" style={{ width: '90%' }}>
      <div className="col">
        <p>{props.candidateNumber}</p>
      </div>
      <div className="col">
        <p>{props.candidate}</p>
      </div>
      <div className="col">
        <p>{props.candidateVotes}</p>
      </div>
    </div>
  );
}
