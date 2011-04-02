% swi-prolog implementation of ebeats
%
% swipl -q -t ebeats -s ebeats.pl
ebeats :-
	get_time(T),
	stamp_date_time(T,date(_,_,_,H,M,S,_,_,_),'UTC'),
	format('@~2f~n',[(H*3600 + M*60 + S) * 0.01157407]).

