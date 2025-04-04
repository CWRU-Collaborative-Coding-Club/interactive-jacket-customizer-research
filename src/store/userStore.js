import { create } from 'zustand'
import { temporal } from 'zundo';

const userStore = create(
    temporal((set, get) => ({
        participant: {
            id: null,
            itemID: null,
        },
        sessionState: 'inactive',
        interactionData: [],

        setParticipant: (participant) => set({ participant }),
        setSessionState: (sessionState) => set({ sessionState }),
        addInteractionData: (interaction) =>
            set((state) => ({
                interactionData: [...state.interactionData, interaction],
            })),
        clearInteractionData: () =>
            set(() => ({
                interactionData: [],
            })),
        
            exportData: () => {
                const { interactionData } = useUserStore.getState();
                const dataStr = JSON.stringify(interactionData, null, 2);
                const blob = new Blob([dataStr], { type: 'application/json' });
                const url = URL.createObjectURL(blob);
                const link = document.createElement('a');
                link.href = url;
                link.download = 'interaction_data.json';
                link.click();
                URL.revokeObjectURL(url);
            },
    })),
);

