import apiClient from './apiClient';

export interface User {
  id: string;
  email: string;
  name: string;
  createdAt: string;
  updatedAt: string;
}

export const userService = {
  getUsers: async (): Promise<User[]> => {
    const response = await apiClient.get<User[]>('/users');
    return response.data;
  },
  
  getUserById: async (id: string): Promise<User> => {
    const response = await apiClient.get<User>(\/users/\\);
    return response.data;
  },
  
  createUser: async (userData: Omit<User, 'id' | 'createdAt' | 'updatedAt'>): Promise<User> => {
    const response = await apiClient.post<User>('/users', userData);
    return response.data;
  },
  
  updateUser: async (id: string, userData: Partial<User>): Promise<User> => {
    const response = await apiClient.put<User>(\/users/\\, userData);
    return response.data;
  },
  
  deleteUser: async (id: string): Promise<void> => {
    await apiClient.delete(\/users/\\);
  },
};
