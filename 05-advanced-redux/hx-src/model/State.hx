package model;

typedef State = {

	scenarios : ScenariosState
}

typedef ScenariosState = {
	scenarios : Array<dto.Scenario>,
	isFetching : Bool
}