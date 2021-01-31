import React from 'react';
import Candidate from './Candidate';
import VoteForm from './VoteForm';

export default function Body(props) {
  return (
    <div className="mt-4 text-center" style={{ color: '#006a71' }}>
      <h2>Election Results</h2>
      <hr style={{ width: '70%', borderStyle: 'solid', borderWidth: '2px', borderColor: '#eebb4d' }} />
      <div className="p-3 ml-auto mr-auto border rounded" style={{ width: '40%' }}>
        <div className="row ml-auto mr-auto  mb-2" style={{ width: '90%' }}>
          <div className="col">
            <p>#</p>
          </div>
          <div className="col">
            <p>Name</p>
          </div>
          <div className="col">
            <p>Votes</p>
          </div>
        </div>
        <hr style={{ width: '90%', borderStyle: 'solid', borderColor: '#eebb4d' }} />
        <Candidate candidateNumber={1} candidate={'Candidate 1'} candidateVotes={props.candidate1Votes} />
        <hr style={{ width: '90%', borderStyle: 'solid', borderColor: '#eebb4d' }} />
        <Candidate candidateNumber={2} candidate={'Candidate 2'} candidateVotes={props.candidate2Votes} />
      </div>
      <div className="my-5 mr-auto ml-auto text-left" style={{ width: '70%' }}>
        <h5>Cast Your Vote:</h5>
        <VoteForm castVote={props.castVote} />
      </div>
      <p className="my-5">
        Your address: <span className="font-weight-bold">{props.account}</span>{' '}
      </p>
      <p className="mt-3">
        Winner is <span className="font-weight-bold">{props.winner}</span>
        <br />
        Total {props.candidate1Votes + props.candidate2Votes} people have voted
      </p>
    </div>
  );
}
