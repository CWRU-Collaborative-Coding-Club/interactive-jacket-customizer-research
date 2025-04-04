import { create } from 'zustand'

const useStore = create((set) => ({
    participant: {
        id: null,
        itemID: null, // This will store the design ID of the participant
    },
    sessionState: 'inactive',
    interactionData: [],


