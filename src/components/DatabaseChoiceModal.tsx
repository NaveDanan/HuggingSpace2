import React from 'react';
import Modal from 'react-modal';
import { db, isSupabase } from '../lib/db';

const DatabaseChoiceModal: React.FC<DatabaseChoiceModalProps> = ({ isOpen, onRequestClose }) => {
  const dbType = isSupabase ? "Supabase Database" : "Local PostgreSQL Database";
  const dbHost = isSupabase ? 
    import.meta.env.VITE_SUPABASE_DB_HOST : 
    import.meta.env.VITE_PG_HOST;

  return (
    <Modal
      isOpen={isOpen}
      onRequestClose={onRequestClose}
      className="fixed inset-0 flex items-center justify-center"
      overlayClassName="fixed inset-0 bg-black bg-opacity-50"
    >
      <div className="bg-white dark:bg-gray-800 rounded-lg p-6 max-w-sm w-full mx-4 shadow-xl">
        <div className="text-center">
          <h2 className="text-xl font-semibold mb-4 text-gray-900 dark:text-white">
            Database Connection Info
          </h2>
          <p className="mb-2 text-gray-700 dark:text-gray-300">
            Connected to: {dbType}
          </p>
          <p className="mb-4 text-gray-700 dark:text-gray-300">
            Host: {dbHost}
          </p>
          <button
            onClick={onRequestClose}
            className="bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded-md transition-colors"
          >
            Ok
          </button>
        </div>
      </div>
    </Modal>
  );
};

export default DatabaseChoiceModal;