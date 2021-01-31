import React, { useState } from 'react';

export default function VoteForm(props) {
  const [candidateId, setCandidate] = useState('');

  const handleSelect = event => {
    setCandidate(event.target.value);
  };

  const handleSubmit = event => {
    event.preventDefault();
    if (candidateId !== '') props.castVote(Number(candidateId));
    else window.alert('choose a candidate');
  };
  return (
    <form onSubmit={handleSubmit}>
      <select name="candidate" className="form-control" onChange={handleSelect}>
        <option defaultValue value="">
          Select
        </option>
        <option value="1">Kitty</option>
        <option value="2">Doggy</option>
      </select>
      <button className="btn btn-primary mt-2 btn-md w-100">Vote Candidate {candidateId}</button>
    </form>
  );
}
