<template>
  <div>
    <div class="flex justify-between items-center mb-4">
      <h1 class="text-2xl font-semibold">
        Task List
      </h1>
      <button>
        <i class="fas fa-plus-circle text-blue-500 text-4xl" @click="openCreateTaskModal">&nbsp;</i>
      </button>
    </div>
    <TaskList :tasks="tasks" @reloadTaskList="getUserTask" />
    <TaskModal v-if="modal.isModalOpen" @reloadTaskList="getUserTask" />
  </div>
</template>
<script>
import TaskList from '~/components/task-list.vue'
import TaskModal from '~/components/task-modal.vue'
export default {
  components: {
    TaskList,
    TaskModal
  },
  data () {
    return {
      tasks: []
    }
  },
  mounted () {
    if (!this.$auth.loggedIn) {
      this.$router.push('/login')
    }
    this.getUserTask()
  },
  methods: {
    /**
     * Opens create task modal
     */
    openCreateTaskModal () {
      this.$store.dispatch('task-modal/openModal', { type: 'add', task: null })
    },
    /**
     * Get user task
     * @returns {Promise<void>}
     */
    async getUserTask () {
      const response = await this.$axios.get('/api/getTask')
      this.tasks = response.data
    }
  }
}
</script>
